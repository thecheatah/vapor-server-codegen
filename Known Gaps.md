# Known Gaps

1. Parameters in a path must be strings
in `path/{param1}/and/{param2}` both `param1` and `param2` must be declared as strings in the swagger

2. Path parameters must be listed in swagger parameters section in the same order that they appear in the path

3. Enum types cannot be used as responses or requests. They can be in arrays and objects directly. If an enum type is used in a response or a request directly, it will appear as a string
This issue is the result of the way that codegen generates the json for the mustache template engine

4. Enum types cannot be used as in arrays. They will not appear as enums, rather they will appear as strings
This issue is the result of the way that codegen generates the json for the mustache template engine

5. Request optional headers must be implemented as array headers where the array is empty if no headers were sent

6. Response only supports a single header being returned. There is a bug with the swagger-code parsers where the "hasMore" flag is not set to true correctly.

7. Response headers cannot be marked as required. There is a bug with the code parser, that results in the required parameter not being set correctly.

8. Does not support more then one authentication mechanism per endpoint.

9. URL Path parameter slug names must match. The following endpoints will conflict `/user/{userId}` and `/user/{anotherName}/messages`. To fix this the second endpoint should be `/user/{userId}/messages`

10. Models that refer another models don't result in a typealias
    ```yaml
    SendMessageRequest:
      $ref: '#/components/schemas/MessageToSend'
    ```
    Workaround:
    ```yaml
    SendMessageRequest:
      allOf:
        - $ref: '#/components/schemas/MessageToSend'
    ```

11. GET Query parameters that are arrays have to end with `[]`