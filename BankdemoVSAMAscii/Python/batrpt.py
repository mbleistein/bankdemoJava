import sys
import os
import requests
import json

def main(args=None):
    if args is None:
        args = sys.argv[1:]

    print("=== Python Batch Report ===")
    print(f"  Script: {__file__}")
    print(f"  Mode: {'module' if args != sys.argv[1:] else 'script'}")
    print(f"  Arguments: {args}")
    print(f"  Python version: {sys.version}")
    print(f"  PYTHONPATH: {os.environ.get('PYTHONPATH', '(not set)')}")
    print(f"  ESPY_WORKING_DIR: {os.environ.get('ESPY_WORKING_DIR', '(not set)')}")
    print(f"  ESPY_OUTPUT_ENCODING: {os.environ.get('ESPY_OUTPUT_ENCODING', '(not set)')}")
    print("=== Report Complete ===")
    
    principal = 45000
    term = 48
    rate = 5.99
    
    jsonString = json.dumps({
        "principal": principal,
        "term": term,
        "rate": float(rate) 
        })
    
# Could use this too and use json=jsonBody in the request.post    
    jsonBody = {
    "principal": principal,
    "term": term,
    "rate": rate
    }
# Could use this too and use json=jsonBody in the request.post 
    
    print("jsonString: ", jsonString)
    print("jsonBody: ", jsonBody)
    funcUrl = "https://rclnaejts8.execute-api.us-east-1.amazonaws.com/mbdefaultstage/loanamortLambda"

    response = requests.post(funcUrl, data=jsonString, headers={"Content-Type": "application/json"})
    print("Status code: ", response.status_code)
    amortdata = response.json()
    if isinstance(amortdata, str):
        amortdata = json.loads(data)
        
    amort_list = amortdata.get("amortList", [])

    for entry in amort_list:
        pay_date_no = entry.get("payDateNo", "").strip()
        interest = entry.get("interestPaid", "").strip()
        principal = entry.get("principalPaid", "").strip()
        payment = entry.get("payment", "").strip()
        balance = entry.get("balance", "").strip()
        print(f"{pay_date_no} | Payment: {payment} | Principal: {principal} | Interest: {interest} | Balance: {balance}")
    
    print("-" * 60)
    
    totInt = amortdata.get("totalInterest", "$0.00").strip()
    print(f"Total Interest: {totInt}")

    
if __name__ == "__main__":
    main()