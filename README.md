# Gamle Oslo Venstre bydelsprogram 2019-2023

## Last ned program

  [Gamle Oslo Venstre bydelsprogram 2019-2023 (PDF)](https://gamle-oslo-venstre.github.io/program/gov-bydelsprogram-2019-2023.pdf)

  [Gamle Oslo Venstre bydelsprogram 2019-2023 (HTML)](https://gamle-oslo-venstre.github.io/program/gov-bydelsprogram-2019-2023.html)
## Generere program

  PDF: 

  pandoc --pdf-engine xelatex --toc -f markdown gov-bydelsprogram-2019-2023.md -o gov-bydelsprogram-2019-2023.pdf
  
  HTML:
  
  pandoc --css pandoc.css -s --toc-depth 2 --toc --pdf-engine xelatex -f markdown gov-bydelsprogram-2019-2023.md --metadata pagetitle="Gamle Oslo Venstre bydelsprogram 2019-2023" | perl -wple 's/eps/svg/' > gov-bydelsprogram-2019-2023.html
    
