-- Problem: 3475. DNA Pattern Recognition

-- Table:Samples
-- +----------------+---------+
-- | Column Name    | Type    | 
-- +----------------+---------+
-- | sample_id      | int     |
-- | dna_sequence   | varchar |
-- | species        | varchar |
-- +----------------+---------+

-- Description: Biologists are studying basic patterns in DNA sequences.
-- Write a solution to identify sample_id with the following patterns:

-- Sequences that start with ATG (a common start codon)
-- Sequences that end with either TAA, TAG, or TGA (stop codons)
-- Sequences containing the motif ATAT (a simple repeated pattern)
-- Sequences that have at least 3 consecutive G (like GGG or GGGG)

-- Return the result table ordered by sample_id in ascending order.

-- Solution:

SELECT 
    SAMPLE_ID,
    DNA_SEQUENCE,
    SPECIES,
    DECODE(SUBSTR(DNA_SEQUENCE, 1, 3), 'ATG', 1, 0) AS has_start,
    SIGN(REGEXP_COUNT(DNA_SEQUENCE, '(TAA|TAG|TGA)$')) AS has_stop,
    SIGN(INSTR(DNA_SEQUENCE, 'ATAT')) AS has_atat,
    SIGN(INSTR(DNA_SEQUENCE, 'GGG')) AS has_ggg
FROM SAMPLES
ORDER BY SAMPLE_ID ASC;