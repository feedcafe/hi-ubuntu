awk $([[ $(awk --version) = GNU* ]] && echo --non-decimal-data) -F' ' '
    BEGIN {OFS = FS}
    {
        $4 = sprintf("%d", "0x" $4)
        print
    }'
