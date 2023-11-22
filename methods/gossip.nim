import std/json
import httpclient
import std/strformat
import std/strutils
import std/re
from provider import Provider


proc eth_blockNumber(
            provider: Provider,
            id: int = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode = 

        var 
            client = newHttpClient()
            url: string
            
        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        let 
            data: JsonNode = %*{
                "jsonrpc":"2.0",
                "method":"eth_blockNumber",
                "params": [],
                "id":id
            }
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)
        
        return responseJson


proc eth_getBalance(
            provider: Provider,
            address: string = "",
            block_number: string = "",
            default_block: string "latest",
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode = 

        var 
            client = newHttpClient()
            params: [2,string]
            url: string
            
        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        if default_block != "":
            assert default_block in ["earliest","latest","pending"]
            params = [address,efault_block]
        else:
            assert contains(block_number,re("0x"))
            params = [address,block_number]


        let 
            data: JsonNode = %*{
                "jsonrpc":"2.0",
                "method":"eth_getBalance",
                "params": [],
                "id":id
            }
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)
        
        return responseJson
