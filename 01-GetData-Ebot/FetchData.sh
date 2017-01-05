#! /usr/bin/env bash
set -u
set -e

OUTDIR=DATAHERE
[[ -d $OUTDIR ]] || mkdir $OUTDIR

arr=`awk -F',' 'NR>1 {print $1}' ../config.txt`

for TERM in $arr
do	    
    echo "Searching Pubmed between 1996 and 2016: $TERM"
#    perl searchPubmedBtwnPubDates.pl $TERM $OUTDIR/$TERM-pmids.txt
#    wc -l $OUTDIR/$TERM-pmids.txt
#    perl warpAroundfetchPubmedData.pl $OUTDIR/$TERM-pmids.txt $OUTDIR/$TERM-pubmed.xml
#    perl convert2tsv.pl $OUTDIR/$TERM-pubmed.xml > $OUTDIR/$TERM-papers.tsv
#    perl getPM2Author.pl $OUTDIR/$TERM-pubmed.xml > $OUTDIR/$TERM-authors.tsv
#
#    echo "Searching Pubmed Central between 1996 and 2016: $TERM"
#    perl searchPMCBtwnPubDates.pl $TERM $OUTDIR/$TERM-pmcids.txt
#    wc -l $OUTDIR/$TERM-pmcids.txt
    #    perl warpAroundfetchPMCfulltext.pl $OUTDIR/$TERM-pmcids.txt $OUTDIR/$TERM-fulltext.xml
    KEYWORD=`echo $TERM | sed 's/+/ /g'`
    perl convertPMC2tsv.pl "$KEYWORD" $OUTDIR/$TERM-pmc-papers.tsv $OUTDIR/$TERM-pmc-authors.tsv $OUTDIR/$TERM-fulltext.xml
done

