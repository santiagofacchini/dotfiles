# Declare NGROK_API_KEY and SERVER_USER

RESPONSE=$(curl -H "Authorization: Bearer $NGROK_API_KEY" -H "Ngrok-Version: 2" https://api.ngrok.com/tunnels | jq ".tunnels[].public_url")

echo "PUBLIC_URL: $RESPONSE"

URL=${RESPONSE:7:17}
PORT=${RESPONSE:25:5}

echo "URL: $URL"
echo "PORT: $PORT"
echo "Connecting to $SERVER_USER@$URL -p $PORT"

ssh $SERVER_USER@$URL -p $PORT
