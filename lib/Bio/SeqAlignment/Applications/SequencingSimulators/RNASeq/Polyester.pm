use strict;
use warnings;

package Bio::SeqAlignment::Applications::SequencingSimulators::RNASeq::Polyester;
$Bio::SeqAlignment::Applications::SequencingSimulators::RNASeq::Polyester::VERSION = '0.02';
# ABSTRACT: Skeleton package that does nothing but reserve the namespace.

1;

  __END__

#!/usr/bin/perl

=head1 NAME

polyester_polyA.pl - A Perl application for enhancing the polyester RNA 
sequencing simulation tool.

=head1 VERSION

version 0.02

=head1 SYNOPSIS

polyester_polyA.pl [options]

=head1 DESCRIPTION

The purpose of the application is to enhance the polyester RNA sequencing
simulation tool by including polyA tails in the reference RNA being used to
generate the simulated  sequencing data. The application is a wrapper around
the R package polyester, which only accounts for the processes of fragmentation,
reverse complementation and sequencing when generating data. 
Note that the Perl application does not (at this moment) include the possibility
of passing logspline R objects as parameters to the R script and the the 
polyester "simulate_experiment" function.
The command line options are the same as the ones in the polyester R package,
with the exception of:
* The addition of the --taildist option, which is mandatory and specifies
the tail distribution to be used.
* The addition of the --distparams option, which is mandatory and specifies
the parameters of the distribution.
* The addition of the --maxseqs option, which is optional and specifies
whether to break the single fasta file generated by the application into
multiple files of a specified maximum number of sequences.
* The addition of the --modformat option, which is optional and specifies
the format for storing modifications (one of JSON, YAML, or MessagePack).
* BONUS: provide a R script that can be used to control the polyester
  simulation process from the command line (polyester.R)
All other parameters have the same interpretation and semantics as in the
polyester R package.



=head1 OPTIONS

=over 4

=item B<--bias, -b> [STRING]

Fragment selection bias (optional).

=item B<--distparams, -P> [FLOAT1 FLOAT2 ...]

Distribution parameters (mandatory, list of numeric values).

=item B<--errormodel, -e> [STRING]

Error model (optional).

=item B<--errorrate, -E> [FLOAT]

Error probability (optional).

=item B<--fastafile, -f> [PATH]

Fasta file path (mandatory).

=item B<--fcfile, -c> [PATH]

Fold change file path (optional).

=item B<--fraglen, -F> [INTEGER]

Fragment length (average) (optional).

=item B<--fragsd, -S> [INTEGER]

Fragment length (standard deviation) (optional).

=item B<--gcbias, -g> [INTEGER]

GC bias (optional).

=item B<--modformat, -m> [INTEGER]

Case insensitive format for storing modifications 
(one of JSON, YAML, or MessagePack) (optional).

=item B<--maxseqs, -m> [INTEGER]

Maximum sequences per file (optional).

=item B<--numreps, -n> [INTEGER1 INTEGER2 ...]

Number of replicates in each group (optional, list).

=item B<--outdir, -o> [PATH]

Path to output directory (optional).

=item B<--paired, -p> [TRUE|FALSE]

Paired reads (optional).

=item B<--readlen, -R> [INTEGER]

Read length (optional).

=item B<--readsfile, -r> [PATH]

Reads per transcript file path (optional).

=item B<--seed, -d> [INTEGER]

Random seed (optional).

=item B<--strandspec, -s> [TRUE|FALSE]

Strand specificity (optional).

=item B<--taildist, -t> [STRING]

Tail distribution (mandatory).

=item B<--writeinfo, -w> [INTEGER]

Save simulation info (optional).

=back

=head1 EXAMPLES

  polyester_polyA.pl --fastafile myseq.fasta --taildist gamma \
  --distparams 125.0 1.0 0.0 250.0 --fraglen 100 --fragsd 10 \
  --numreps 1 --strandspec TRUE --readlen 75 --paired F \
  --maxseqs 1000 --modformat YAML --outdir /path/to/output

=head1 TODO

=over 4

=item * 

Add the possibility of passing logspline R objects as parameters to the
R script and the polyester "simulate_experiment" function.

=item *

Add the possibility of adding UMI tags to sequences.

=item *

Add the possibility of adding sequencing adapters to sequences.

=back 

=head1 SEE ALSO

=over 4

=item * L<polyester|https://github.com/alyssafrazee/polyester>

Polyester is an R package designed to simulate RNA sequencing experiments with
differential transcript expression.Given a set of annotated transcripts, 
Polyester will simulate the steps of an RNA-seq experiment (fragmentation, 
reverse-complementing, and sequencing) and produce files containing simulated 
RNA-seq reads. Simulated reads can be analyzed using your choice of downstream 
analysis tools.
Polyester has a built-in wrapper function to simulate a case/control experiment 
with differential transcript expression and biological replicates. Users are 
able to set the levels of differential expression at transcripts of their 
choosing. This means they know which transcripts are differentially expressed 
in the simulated dataset, so accuracy of statistical methods for differential 
expression detection can be analyzed.

Polyester offers several unique features:

* Built-in functionality to simulate differential expression at the transcript level
* Ability to explicitly set differential expression signal strength
* Simulation of small datasets, since large RNA-seq datasets can require 
lots of time and computing resources to analyze
* Generation of raw RNA-seq reads, as opposed to alignments or transcript-level 
abundance estimates
* Transparency/open-source code

=back

=head1 AUTHOR

Christos Argyropoulos <chrisarg@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2024 by Christos Argyropoulos.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
