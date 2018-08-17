from lyft_rides.auth import ClientCredentialGrant
from lyft_rides.session import Session
from lyft_rides.client import LyftRidesClient

auth_flow = ClientCredentialGrant(
        'yM-_iRPCi4-f',
        'PyRA3zG4llCje6ZoBBqdpLr5ITTuu3qR',
        ['public', 'profile', 'rides.read', 'rides.request'],
        )
session = auth_flow.get_session()
client = LyftRidesClient(session)
response = client.get_cost_estimates(start_latitude=42.299709,
        start_longitude=-71.351121,
        end_latitude=42.288493,
        end_longitude=-71.359711,
        ride_type='lyft_line')
print response.json
response = client.get_ride_types(42.299709,-71.351121)
ride_types = response.json.get('ride_types')
print ride_types

