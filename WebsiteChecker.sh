#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print function with color
print_color() {
    local color="$1"
    local text="$2"
    echo -e "${color}${text}${NC}"
}

# Function to show help menu
show_help() {
    echo "Usage: $0 [OPTION]... [URL]"
    echo "Perform various checks on a given website."
    echo ""
    echo "Options:"
    echo "  -A        Perform all checks (SSL, HTTP headers, ping)"
    echo "  -c        Check the SSL certificate only"
    echo "  -h        Check the HTTP headers only"
    echo "  -p        Perform a ping test only"
    echo "  -help     Display this help and exit"
    echo ""
    echo "Example:"
    echo "  $0 -A https://www.example.com"
    echo "  $0 -c https://www.example.com"
}

# Check SSL certificate
check_ssl() {
    local url=$1
    local domain=$(echo $url | awk -F[/:] '{print $4}')
    print_color $YELLOW "Checking SSL certificate for $domain..."
    local ssl_output=$(echo | openssl s_client -servername "$domain" -connect "$domain:443" 2>/dev/null | openssl x509 -noout -dates)
    if [ -n "$ssl_output" ]; then
        local start_date=$(echo "$ssl_output" | grep 'notBefore=' | cut -d= -f2)
        local end_date=$(echo "$ssl_output" | grep 'notAfter=' | cut -d= -f2)
        printf "${BLUE}%-20s %-30s\n" "Valid From:" "$start_date"
        printf "%-20s %-30s\n" "Valid Until:" "$end_date"
        echo ""
    else
        print_color $RED "Failed to retrieve SSL certificate."
    fi
}

# Check HTTP headers
check_http_headers() {
    local url=$1
    print_color $YELLOW "Checking HTTP headers for $url..."
    curl -s -D - "$url" -o /dev/null | head -n 10
    echo ""
}

# Perform a simple ping
ping_site() {
    local url=$(echo $1 | awk -F/ '{print $3}')
    print_color $YELLOW "Pinging $url..."
    ping -c 4 "$url" | grep 'transmitted' 
    echo ""
}

# Main execution
main() {
    local url=""
    local ssl=1
    local headers=1
    local ping=1
    local help_needed=0

    while getopts "Achp" opt; do
        case $opt in
            A) ssl=1; headers=1; ping=1 ;;
            c) ssl=1; headers=0; ping=0 ;;
            h) ssl=0; headers=1; ping=0 ;;
            p) ssl=0; headers=0; ping=1 ;;
            \?) help_needed=1 ;;
        esac
    done

    # Check if help is needed
    for arg in "$@"; do
        if [[ $arg == "-help" ]]; then
            help_needed=1
            break
        fi
    done

    if [[ $help_needed -eq 1 ]]; then
        show_help
        exit 0
    fi

    shift $((OPTIND-1))

    if [[ -z "$1" ]]; then
        print_color $RED "Missing URL. Use -help for more information."
        exit 1
    fi

    url=$1

    if [[ $ssl -eq 1 ]]; then
        check_ssl "$url"
    fi
    if [[ $headers -eq 1 ]]; then
        check_http_headers "$url"
    fi
    if [[ $ping -eq 1 ]]; then
        ping_site "$url"
    fi
}

main "$@"
