gawk -F' ' '{
		p1 = "0x" $4;
		printf "%s %s %s %d\n", $1, $2, $3, strtonum(p1);
            }'
