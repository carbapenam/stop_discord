# Configuration

$lower_hour_limit = 23 # hh:00:00
$upper_hour_limit = 23 # hh:59:59

$lower_date_limit = Get-Date -Hour $lower_hour_limit -Minute 00 -Second 00
$upper_date_limit = Get-Date -Hour $upper_hour_limit -Minute 59 -Second 59

$current_date = Get-Date

# Set Discord path and executable name here.

$discord_path = ''
$discord_exec_name = discord

# Only turn on discord between the hours.

if ($current_date -gt $lower_date_limit -and $current_date -lt $upper_date_limit) {$discord}
else {exit}

# Check every minute if the time's passed.
while(1)
{
   $current_date = Get-Date
   if ($current_date -gt $upper_date_limit) {Stop-Process -name $discord_exec_name; break;}
   start-sleep -seconds 60
}