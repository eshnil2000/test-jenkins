# Hands On Blockchain DevOps: Build API using Jenkins,Swagger, Python, Docker!

### To add API

### Swaggerfile additions:
```
definitions:

  SingleBlock:
    type: object
    properties:
      number:
        type: number


  /getblock:
    post:
      tags:
        - get block #
      summary: get block
      description: ''
      operationId: getBlock
      consumes:
        - application/json
      produces:
        - application/json
      parameters:
        - in: body
          name: body
          description: get a block by #
          required: true
          schema:
            $ref: '#/definitions/SingleBlock'
      responses:
        '200':
          description: successful operation
        '405':
          description: Invalid input
  
  /info:
    get:
      tags:
        - Get info
      summary: Gets the info
      description: ''
      operationId: getInfo
      produces:
        - application/json
      responses:
        '200':
          description: successful operation
          
        '400':
          description: Invalid status value
```

### blockchain.py additions
```
@app.route('/info', methods=['GET'])
def chain_info():
    response = {
        'owner': 'DappsUni',
        'User': 'Nilesh',
    }
    return jsonify(response), 200

@app.route('/getblock', methods=['POST'])
def get_block():
    values = request.get_json()
    response = {
        'blockNo': values['number'],
        'block': blockchain.chain[values['number']],
    }
    return jsonify(response), 200

```
