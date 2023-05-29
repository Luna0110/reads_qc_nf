#!/usr/bin/env python3
"""Extract relevant fields from fastp output json"""

import sys

import click
import pandas as pd


def main():
    col_names = [
        "total_reads",
        "total_bases",
        "q20_bases",
        "q30_bases",
        "q20_rate",
        "q30_rate",
        "read1_mean_length",
        "read2_mean_length",
        "gc_content",
    ]
    df = pd.DataFrame(columns=col_names)
    for filename in sys.argv[1:]:

        json_data = pd.read_json(filename)
        data = json_data["summary"]["before_filtering"]
        df.loc[filename] = data


    df.to_csv("fastp_results_extracted.csv")


if __name__ == "__main__":
    main()