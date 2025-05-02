function bytes_to_mb_gb
    set bytes_size $argv[1]

    # Check if the argument is numeric
    if not math $bytes_size
        echo "Error: Please provide a numeric value in bytes."
        return
    end

    set mb_size (math "$bytes_size / (1024^2)")
    set gb_size (math "$bytes_size / (1024^3)")

        echo "$bytes_size bytes is equal to $gb_size GB"
        echo "$bytes_size bytes is equal to $mb_size MB"
end

