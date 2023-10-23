import std/json
import httpclient
import std/strformat
import std/strutils
import std/re
from provider import Provider




proc eth_getBalance*(
            provider: Provider,
            address: string,
            block_number: string = "",
            default_block: string = "",
            id: int = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode =

        var 
            client = newHttpClient()
            params: array[2,string]
            url: string
        
        client.headers = headers

        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        if default_block != "":
            params = [address,default_block]
        else:
            params = [address,block_number]

        let data = %*{
            "jsonrpc":"2.0",
            "method":"eth_getBalance",
            "params": params,
            "id":id
        }


        let 
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)

        return responseJson




proc eth_getTransactionCount*(
            provider: provider.Provider,
            address: string,
            block_number: string = "",
            default_block: string = "",
            id: int = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode =

        var 
            client = newHttpClient()
            params: array[2,string]
            url: string
        
        client.headers = headers

        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        if default_block != "":
            params = [address,default_block]
        else:
            params = [address,block_number]

        let data = %*{
            "jsonrpc":"2.0",
            "method":"eth_getTransactionCount",
            "params": params,
            "id":id
        }

        let 
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)

        return responseJson
