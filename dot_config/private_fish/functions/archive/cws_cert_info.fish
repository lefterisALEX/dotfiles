function cws_cert_info
 echo | openssl s_client -connect $argv:443 2>/dev/null | openssl x509 -noout -subject -enddate -issuer
end
