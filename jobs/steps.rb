# widget configuration

unit_system   = "METRIC"
date_format   = "%H:%M"
animate_views = true

SCHEDULER.every "15m", first_in: 0 do |job|
  steps = Steps.new unit_system: unit_system, date_format: date_format
  if steps.errors?
    send_event "steps", { error: steps.error }
  else
    send_event "steps", {
      device:   steps.device,
      steps:    steps.steps,
      calories: steps.calories,
      distance: steps.distance,
      active:   steps.active,
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
