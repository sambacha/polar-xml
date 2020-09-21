# XML CONFORMANCE

> XML conformance utilities 


## Usage

- NPX Package 
- Repository Settings
- Dockerized XML Lint
- additional settings 

## Examples 

### Prettier-XML

Configuration
```json
{
    "tabWidth": 4,
    "xmlSelfClosingSpace": true,
    "printWidth": 210,
    "xmlWhitespaceSensitivity": "strict"
}
```
Run
`$ ./node_modules/.bin/prettier --write '**/*.xml'`

### EditorConfig Lint

`eclint --fix .`


## License 
SPDX-License-Identifier: ISC

