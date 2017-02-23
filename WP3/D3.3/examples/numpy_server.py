# Python server to demonstrate calling NumPy from GAP SCSCP client
# Based on https://github.com/OpenMath/py-scscp/blob/master/demo_server.py

import socket
try:
    import socketserver
except:
    import SocketServer as socketserver
import logging
from openmath import openmath as om, convert as conv
import numpy

from scscp.client import TimeoutError, CONNECTED
from scscp.server import SCSCPServer
from scscp.scscp import SCSCPQuit, SCSCPProtocolError
from scscp import scscp

def polyroots( coeffs ):
	f = numpy.polynomial.polynomial.Polynomial( coeffs )
	r = f.roots()
	return [ [x.real,x.imag] for x in r]

# Supported functions
CD_SCSCP2 = ['get_service_description', 'get_allowed_heads', 'is_allowed_head']
CD_ARITH1 = {
    'abs'         : abs,
    'unary_minus' : lambda x  : -x,
    'minus'       : lambda x,y: x-y,
    'plus'        : lambda x,y: x+y,
    'divide'      : lambda x,y: x/y,
    'times'       : lambda x,y: x*y,
    'power'       : lambda x,y: x**y,
}
CD_SCSCP_TRANSIENT1 = {
    'numpy.linalg.det'         : numpy.linalg.det,
    'numpy.linalg.matrix_rank' : lambda x: int(numpy.linalg.matrix_rank(x)),
    'polyroots'                : polyroots
}

class SCSCPRequestHandler(socketserver.BaseRequestHandler):
    def setup(self):
        self.server.log.info("New connection from %s:%d" % self.client_address)
        self.log = self.server.log.getChild(self.client_address[0])
        self.scscp = SCSCPServer(self.request, self.server.name,
                                     self.server.version, logger=self.log)
        
    def handle(self):
        self.scscp.accept()
        while True:
            try:
                call = self.scscp.wait()
            except TimeoutError:
                continue
            except SCSCPQuit as e:
                self.log.info(e)
                break
            except ConnectionResetError:
                self.log.info('Client closed unexpectedly.')
                break
            except SCSCPProtocolError as e:
                self.log.info('SCSCP protocol error: %s.' % str(e))
                self.log.info('Closing connection.')
                self.scscp.quit()
                break
            self.handle_call(call)

    def handle_call(self, call):
        if (call.type != 'procedure_call'):
            raise SCSCPProtocolError('Bad message from client: %s.' % call.type, om=call.om())
        try:
            head = call.data.elem.name
            self.log.debug('Requested head: %s...' % head)
            
            if call.data.elem.cd == 'scscp2' and head in CD_SCSCP2:
                res = getattr(self, head)(call.data)
            elif call.data.elem.cd == 'arith1' and head in CD_ARITH1:
                args = [conv.to_python(a) for a in call.data.arguments]
                res = conv.to_openmath(CD_ARITH1[head](*args))
            elif call.data.elem.cd == 'scscp_transient_1' and head in CD_SCSCP_TRANSIENT1:
                args = [conv.to_python(a) for a in call.data.arguments]
                res = conv.to_openmath(CD_SCSCP_TRANSIENT1[head](*args))
            else:
                self.log.debug('...head unknown.')
                return self.scscp.terminated(call.id, om.OMError(
                    om.OMSymbol('unhandled_symbol', cd='error'), [call.data.elem]))

            strlog = str(res)
            self.log.debug('...sending result: %s' % (strlog[:20] + (len(strlog) > 20 and '...')))
            return self.scscp.completed(call.id, res)
        except (AttributeError, IndexError, TypeError):
            self.log.debug('...client protocol error.')
            return self.scscp.terminated(call.id, om.OMError(
                om.OMSymbol('unexpected_symbol', cd='error'), [call.data]))
        except Exception as e:
            self.log.exception('Unhandled exception:')
            return self.scscp.terminated(call.id, 'system_specific',
                                             'Unhandled exception %s.' % str(e))

    def get_allowed_heads(self, data):
        return scscp.symbol_set([om.OMSymbol(head, cd='scscp2') for head in CD_SCSCP2]
                                    + [om.OMSymbol(head, cd='arith1') for head in CD_ARITH1],
                                    cdnames=['scscp1'])
    
    def is_allowed_head(self, data):
        head = data.arguments[0]
        return conv.to_openmath((head.cd == 'arith1' and head.name in CD_ARITH1)
                                    or (head.cd == 'scscp2' and head.name in CD_SCSCP2)
                                    or head.cd == 'scscp1')

    def get_service_description(self, data):
        return scscp.service_description(self.server.description)

class Server(socketserver.ThreadingMixIn, socketserver.TCPServer, object):
    allow_reuse_address = True
    
    def __init__(self, host='localhost', port=26133,
                     logger=None, name=b'DemoServer', version=b'none',
                     description='Demo SCSCP server'):
        super(Server, self).__init__((host, port), SCSCPRequestHandler)
        self.log = logger or logging.getLogger(__name__)
        self.name = name
        self.version = version
        self.description = description
        
if __name__ == '__main__':
    logging.basicConfig(level=logging.DEBUG)
    logger = logging.getLogger('demo_server')
    srv = Server(logger=logger)
    try:
        srv.serve_forever()
    except KeyboardInterrupt:
        srv.shutdown()
        srv.server_close()

