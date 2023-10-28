from flask import Flask, jsonify
import datetime
import pytz

app = Flask(__name__)

@app.route('/')
def get_time():
    # Get the current time in New-York, Berlin, and Tokyo time zones
    ny_timezone = pytz.timezone('America/New_York')
    berlin_timezone = pytz.timezone('Europe/Berlin')
    tokyo_timezone = pytz.timezone('Asia/Tokyo')

    current_time = datetime.datetime.now()
    ny_time = current_time.astimezone(ny_timezone).strftime('%Y-%m-%d %H:%M:%S %Z')
    berlin_time = current_time.astimezone(berlin_timezone).strftime('%Y-%m-%d %H:%M:%S %Z')
    tokyo_time = current_time.astimezone(tokyo_timezone).strftime('%Y-%m-%d %H:%M:%S %Z')

    # Create an HTML response
    html_response = f"""
    <html>
    <body>
        <h1>Current Time in Different Timezones</h1>
        <p>New York Time: {ny_time}</p>
        <p>Berlin Time: {berlin_time}</p>
        <p>Tokyo Time: {tokyo_time}</p>
    </body>
    </html>
    """

    return html_response

@app.route('/health')
def health_check():
    # Return a JSON response with a status code of 200
    return jsonify({"status": "OK"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
