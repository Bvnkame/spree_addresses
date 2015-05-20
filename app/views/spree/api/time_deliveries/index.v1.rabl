object false
node(:count) { @time_deliveries.count }
child(@time_deliveries => :time_deliveries) do
  attributes :id, :delivery_time
end

