# Advanced Bioinformatics for Next-Generation Sequencing 2025: Week 1




Day | Time |  Subject | Lecturer
--- | --- | --- | ---
Day 1 - Monday | 13:00 - 16:00 | NGS data - Workflow, formats and programs | Thorfinn Sand Korneliussen
Day 2 - Wednesday | 9:15 - 12:00 | Mapping - Suffix arrays and Burrows-Wheeler Transform | Thorfinn Sand Korneliussen (Julian Regalardo)
Day 3 - Wednesday | 13:00 - 16:00 | Surprise | Victor Morenomayar


# Getting started
## Connecting to the server via SSH


X11 forwarding method will allow you to start a graphical application on the remote system and forward this application's windows to your local system. We need to enable X11 forwarding to view the plots we will be generating for the exercises.

We use `-X` option to enable X11 forwarding over SSH:

```sh
$ ssh -X <your_username>@<server_name_or_ip>
```

Replace with your remote server username. For example:


```sh
$ ssh -Y thorfinn@emily.popgen.dk
```




## Setting up the working environment


If you are working on the emily server, all commands in the following seven exercises will be relative to the base directory called `/TEACHING/BIOINF24/adv_binf_2024_week1`

```sh
day1
├── data
│   ├── alignment
│   ├── fasta
│   ├── fastq
│   ├── reference_fasta
│   └── reference_fasta_hs37d5
├── exercises
│   ├── alignment_formats
│   ├── mapdamage
│   ├── trimming
│   └── variant_call_format
├── Makefile
└── README.md
```


