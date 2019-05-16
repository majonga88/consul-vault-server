# Managing Secrets with Vault and Consul

## Want to learn how to build this?

Check out the [post](https://testdriven.io/managing-secrets-with-vault-and-consul).

## Want to use this project?

1. Fork/Clone

1. Build the images and run the containers:

    ```sh
    $ docker-compose up -d --build
    ```

1. You can now interact with both Vault and Consul. View the UIs at [http://localhost:8200/ui](http://localhost:8200/ui) and [http://localhost:8500/ui](http://localhost:8500/ui).

1. Curl examples :

**Consul**

Cli
```sh
curl     -X GET     http://127.0.0.1:8500/v1/kv/config/myApp/my/prop
```

Response
```json
[{"LockIndex":0,"Key":"config/myApp/my/prop","Flags":0,"Value":"dGVzdHM=","CreateIndex":1281,"ModifyIndex":1367}]
```
Documentation : https://www.consul.io/api/kv.html

**Vault**

Cli
```sh
curl     -H "X-Vault-Token: $VAULT_TOKEN"     -X GET     http://127.0.0.1:8200/v1/secret/foo
```

Response
```json
{"request_id":"a35272a2-5f9c-a44f-dfda-995a554841f9","lease_id":"","renewable":false,"lease_duration":2764800,"data":{"bar":"precious"},"wrap_info":null,"warnings":null,"auth":null}
```