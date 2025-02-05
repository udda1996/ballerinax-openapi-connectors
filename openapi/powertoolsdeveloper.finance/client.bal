// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API key `X-IBM-Client-Id`
    string xIbmClientId;
|};

# This is a generated connector for [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612) OpenAPI specification.
# 'Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
# Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
# PowerTools is the ultimate developer toolkit.'
# This connector provides the capability for financial calculations and conversions.
@display {label: "PowerTools Developer Finance", iconPath: "resources/powertoolsdeveloper.finance.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Apptigent account](https://portal.apptigent.com/user/register) and obtain tokens following [this guide](https://portal.apptigent.com/start).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://connect.apptigent.com/api/utilities") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Currency - Convert currency
    #
    # + payload - Currency conversion parameters 
    # + return - OK 
    remote isolated function convertCurrency(InputCurrencyConversion payload) returns OutputNumber|error {
        string  path = string `/ConvertCurrency`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputNumber response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputNumber);
        return response;
    }
    # Currency - Format currency
    #
    # + payload - Currency format parameters 
    # + return - OK 
    remote isolated function formatCurrency(InputCurrencyFormat payload) returns OutputString|error {
        string  path = string `/FormatCurrency`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Finance - Stock prices
    #
    # + payload - Input stock prices parameters 
    # + return - OK 
    remote isolated function stockPrices(InputStockPrices payload) returns OutputStockPrice|error {
        string  path = string `/StockPrices`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputStockPrice response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputStockPrice);
        return response;
    }
    # Finance - Market index
    #
    # + payload - Input market index parameters 
    # + return - OK 
    remote isolated function marketIndex(InputMarketIndex payload) returns OutputMarketIndex|error {
        string  path = string `/MarketIndex`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputMarketIndex response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputMarketIndex);
        return response;
    }
}
