**Nessus2Word**

Covert .nessus into a tabulated data in word document.

Usefull in some part of Host VA report generating, especially on host that have a big set of results.

This is a POC code and not optimized. But it get the job done in a pinch.

* 1st parameter - nessus input file
* 2nd parameter - comma seperated value of severity filter (eg: Critical,High)

```
root@box:~/nessus2word# ./hostvaMain.sh sample.nessus High,Medium
./hostvaMain.sh file.nessus critical,high,medium,low
- 3rd filter not specified
- 4th filter not specified
- Converting .nesssus to csv
- Filtering out serverity
- Merging final Tuple
- Host VA python tuple generator and merger
./hostvaTuple.sh input output

- Generating report

root@box:~/nessus2word#
```

A file "hostvaReport.docx" will be generated at the end.
