# OpenMP
# chips: Haswell, Skylake, Bulldozer

import json
with open('glossary.json') as f:
    l = json.load(f)

output = open('glossary.tex', 'w')
output.write("\\documentclass[landscape]{article}\n\n")
output.write("\\usepackage{array}\n")
output.write("\\usepackage{url}\n")
output.write("\\usepackage{graphicx}\n")
output.write("\\usepackage[hmargin=0.5cm,vmargin=1.3cm]{geometry}\n")
output.write("\\usepackage{stix}\n")
# output.write("\\usepackage{avant}\n")
output.write("\\setlength{\\extrarowheight}{.5pt}\n")
output.write("\\newcommand{\\CC}{C\\nolinebreak\\hspace{-.05em}\\raisebox{.4ex}{\\tiny\\bf +}\\nolinebreak\\hspace{-.10em}\\raisebox{.4ex}{\\tiny\\bf +}}")
output.write("\\renewcommand*{\\UrlFont}{\\ttfamily\\small\\relax}")

output.write("\\begin{document}\n")
output.write("\\thispagestyle{empty}\n")

l1 = l[:len(l)//2]
l2 = l[len(l)//2:]

for l in (l1,l2):
    output.write("\\begin{minipage}{.5\\textwidth}\n")
    if l is l1:
        output.write("\\begin{minipage}{.65\\textwidth}{\\Huge OpenDreamKit Glossary}\end{minipage}")
        output.write("\\hspace{.03\\textwidth}")
        output.write("\\begin{minipage}{.3\\textwidth}")
        output.write("\\includegraphics[scale=0.12]{logos/odk.png}")
        output.write("\\hspace{.18\\textwidth}")
        output.write("\\includegraphics[scale=0.06]{logos/europe.png}")
        output.write("\\end{minipage}")
        output.write("\\vspace{.7cm}\n\n")

    output.write("\\noindent \\begin{tabular}{m{.15\\textwidth}p{.7\\textwidth}}\n")
    output.write("\\hline\n")
    for dat in l:
        name = dat['acronym'] if 'acronym' in dat else dat['name']

        if 'logo' in dat:
            scale = '[scale={}]'.format(dat['logo-rescale']) if 'logo-rescale' in dat else ''

            if dat.get('force-name'):
                output.write('\\begin{minipage}{.15\\textwidth}\n')
                output.write('{{\\large {}}}\n\\\\'.format(name))
                output.write("\includegraphics{}{{logos/{}}}\n".format(scale, dat['logo']))
                output.write('\\end{minipage}&\n')
            else:
                output.write("\includegraphics{}{{logos/{}}} & \n".format(scale, dat['logo']))

        else:
            output.write("{{\\large {}}} & \n".format(name))

        desc = dat.get('description', '')
        if 'acronym' in dat:
            if desc:
                desc = dat['name'] + ": " + desc
            else:
                desc = dat['name']
        output.write('\\begin{tabular}{p{.7\\textwidth}}\n')
        output.write('{}\n'.format(desc))
        if 'url' in dat:
            output.write('\\\\ \\url{{{}}}'.format(dat['url']))
        output.write('\\end{tabular}\n')

        output.write('\\\\\hline\n')
    output.write("\\end{tabular}\n")
    output.write("\\end{minipage}\n")

output.write("\\end{document}\n")


