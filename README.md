# Lokalvalgsprogram 2019-2023

## Generere program

  PDF: 
  pandoc --pdf-engine xelatex --toc -f markdown gov-bydelsprogram-2019-2023.md -o gov-bydelsprogram-2019-2023.pdf
  
  HTML:
  
  pandoc --css pandoc.css -s --toc-depth 2 --toc --pdf-engine xelatex -f markdown gov-bydelsprogram-2019-2023.md --metadata pagetitle="Gamle Oslo Venstre bydelsprogram 2019-2013" | perl -wple 's/eps/svg/' > gov-bydelsprogram-2019-2023.html
    
## Last ned program

  [Gamle Oslo Venstre bydelsprogram 2019-2023](https://github.com/gamle-oslo-venstre/program/raw/master/gov-bydelsprogram-2019-2023.pdf)
