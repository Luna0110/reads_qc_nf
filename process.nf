
process fastp {

    container "${params.fastp_docker}"

    input:
    tuple val(pair_id), path(reads)

    output:
    path "*.json"

    script:
    """
    fastp -i ${reads[0]} -I  ${reads[1]} -j ${pair_id}_fastp.json

    """
}

process q30_extraction {
    
    publishDir "${params.outputDir}"
    container "${params.python_docker}"

    input:
    path json_files

    output:
    path "*"


    """
    json_wrangler.py ${json_files}

    """


}