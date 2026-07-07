#!/bin/bash

wordle() {
    local grays=$1
    shift
    local slots=("$@")
    
    # 1. Print usage block to stderr if no arguments are provided or slot count is wrong
    if [[ -z "$grays" || ${#slots[@]} -ne 5 ]]; then
        {
            echo "Usage: ./wordle.sh \"<grays>\" \"<pos1>\" \"<pos2>\" \"<pos3>\" \"<pos4>\" \"<pos5>\""
            echo ""
            echo "Arguments:"
            echo "  <grays>  Letters that are completely gray (e.g., \"oselyic\")"
            echo "  <pos1-5> Positional constraints for each of the 5 slots:"
            echo "             UPPERCASE = Exact green match (e.g., \"A\")"
            echo "             lowercase = Yellow match / excluded from this slot (e.g., \"a\")"
            echo "             Dot (.)   = Unknown / only exclude grays"
            echo ""
            echo "Example (A and R yellow in slots 1 & 2):"
            echo "  ./wordle.sh \"oselyic\" \"a\" \"r\" \".\" \".\" \".\""
            echo ""
            echo "Example (A and R green in slots 3 & 4):"
            echo "  ./wordle.sh \"oselyicgud\" \"a\" \"r\" \"A\" \"R\" \".\""
        } >&2 # <--- Redirects the whole block to stderr to bypass wc -l
        
        exit 1
    fi
    
    # 2. Start building the dictionary command
    local cmd="egrep '^[a-z]{5}$' /usr/share/dict/words"
    
    # 3. Gather all yellow/green letters to ensure they MUST be in the word
    local includes=$(echo "$*" | tr -d '.' | grep -o '[A-Za-z]' | tr 'A-Z' 'a-z' | sort -u)
    
    for letter in $includes; do
        cmd="$cmd | egrep '$letter'"
    done
    
    # 4. Construct the precise 5-letter regex pattern
    local regex=""
    for slot in "${slots[@]}"; do
        # Extract any uppercase character for a green match
        local green=$(echo "$slot" | grep -o '[A-Z]' | tr 'A-Z' 'a-z')
        
        if [[ -n "$green" ]]; then
            # If there's a green match, it defines this exact position
            regex="${regex}${green}"
        elif [[ -z "$slot" || "$slot" == "." ]]; then
            # Empty string or dot means completely unknown slot
            regex="${regex}[^${grays}]"
        else
            # Strip out any uppercase markers to find the yellow/excluded letters
            local excluded_letters=$(echo "$slot" | tr -d 'A-Z')
            regex="${regex}[^${grays}${excluded_letters}]"
        fi
    done

    # 5. Evaluate the fully constructed pipeline
    eval "$cmd | egrep '$regex'"
}

# Execute the function and pipe the word list into line-count mode
wordle "$1" "$2" "$3" "$4" "$5" "$6" 
