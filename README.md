# je
JSON Editor Utility


input file app_info.json content :

{
    "inner": {
        "key1": "8765"
    },
    "referral_id": "12345"
}

je --filename=app_info.json --path=inner.key1 --value=abcd

resulting file:

{
    "inner": {
        "key1": "abcd"
    },
    "referral_id": "12345"
}
