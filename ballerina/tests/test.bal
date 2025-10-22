// Copyright (c) 2025, WSO2.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
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

import ballerina/test;
import ballerina/io;

configurable ApiKeysConfig apiKeyConfig = ?;
// configurable string serviceUrl = "https://api.temenos.com/api/v9.2.0//holdings";
configurable string accountId = "65846";

final Client temenos = check new (apiKeyConfig);

@test:Config {
    groups: ["GetAccountsBasicDetails"]
}
isolated function testGetAccountsBasicDetails() returns error? {
    AccountInfoResponse|error response = temenos->/accounts/accountsDetails.get();
    if response is AccountInfoResponse {
        io:println("Success Response: ", response);
        test:assertTrue(true, "Successfully retrieved customer information");
    } else {
        test:assertFail("Failed to retrieve customers: " + response.message());
    }
}

@test:Config {
    groups: ["GetAccountDormancyConditions"]
}
isolated function GetAccountDormancyConditions() returns error? {
    AccountDormancyDetailsResponse|error response = temenos->/accounts/[accountId]/dormancyConditions.get();
    if response is AccountDormancyDetailsResponse {
        io:println("Success Response: ", response);
        test:assertTrue(true, "Successfully retrieved customer information");
    } else {
        test:assertFail("Failed to retrieve customers: " + response.message());
    }
}