#!/usr/bin/env nextflow

include {
    fastp;
    q30_extraction
} from './process.nf'

workflow {
    Channel
        .fromFilePairs( params.reads)
        .set{ ch_reads }
    fastp(ch_reads)
    q30_extraction(fastp.out.collect())

}