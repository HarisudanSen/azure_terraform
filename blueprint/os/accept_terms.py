import argparse
import requests, adal, json


parent_parser = argparse.ArgumentParser(description="Provide required inputs",  add_help=True)
parent_parser.add_argument("-t", "--tenant_id", help="Specify tenant_id")
parent_parser.add_argument("-c", "--client_id", help="Specify client_id")
parent_parser.add_argument("-e", "--client_secret", help="Specify client_secret")
parent_parser.add_argument("-s", "--subscription_id", help="Specify subscription_id")
parent_parser.add_argument("-p", "--publisher_name", help="Specify publisher_name")
parent_parser.add_argument("-o", "--offer_name", help="Specify offer_name")
parent_parser.add_argument("-l", "--plan_name", help="Specify plan_name")
args = parent_parser.parse_args()


def get_token():
    authority_url = 'https://login.microsoftonline.com/' + args.tenant_id
    context = adal.AuthenticationContext(authority_url, verify_ssl=False)
    resource = 'https://management.azure.com/'
    token = context.acquire_token_with_client_credentials(resource, args.client_id, args.client_secret)
    return token


def get_terms():
    token = get_token()
    headers = {'Authorization': 'Bearer ' + token['accessToken'], 'Content-Type': 'application/json'}
    url = "https://management.azure.com/subscriptions/{}" \
          "/providers/Microsoft.MarketplaceOrdering/offerTypes/virtualmachine/publishers/{}/offers/{}/plans/{}" \
          "/agreements/current?api-version=2015-06-01".format(args.subscription_id, args.publisher_name,
                                                               args.offer_name, args.plan_name)
    response = requests.get(url, headers=headers, verify=False)
    response_json = json.loads(response.content)
    return response_json


def accept_terms(requsest_data):
    token = get_token()
    headers = {'Authorization': 'Bearer ' + token['accessToken'], 'Content-Type': 'application/json'}
    url = "https://management.azure.com/subscriptions/{}/providers/Microsoft.MarketplaceOrdering" \
          "/offerTypes/virtualmachine/publishers/{}/offers/{}/plans/{}/agreements/current?api" \
          "-version=2015-06-01".format(args.subscription_id, args.publisher_name, args.offer_name, args.plan_name)
    response = requests.put(url, data=requsest_data,  headers=headers, verify=False)
    response_json = json.loads(response.content)
    print(response_json)


if __name__ == '__main__':
    response = get_terms()
    print(response)
    if response and not "error" in response:
        response['properties']['accepted'] = True
        terms = json.dumps(response)
        accept_terms(terms)
    if response and "error" in response:
        print("ERROR : {}".format(response["error"]["message"]))