# widget configuration

unit_system   = "METRIC"
date_format   = "%H:%M"
animate_views = true

SCHEDULER.every "15m", first_in: 0 do |job|
  lifetime = Lifetime.new unit_system: unit_system, date_format: date_format
  if lifetime.errors?
    send_event "lifetime", { error: lifetime.error }
  else
    send_event "lifetime", {
      device:   lifetime.device,
      steps:    lifetime.steps,
      calories: lifetime.calories,
      distance: lifetime.distance,
      active:   lifetime.active,
      animate:  animate_views
    }

    #send_event "lifetime", {
    #    device:   lifetime.device,
    #    steps:    lifetime.steps,
    #    calories: lifetime.calories,
    #    distance: lifetime.distance,
    #    active:   lifetime.active,
    #    animate:  animate_views
    #}
  end
end
