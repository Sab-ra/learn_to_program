require 'rubyfit'
require 'nokogiri'

def read_gpx_file(gpx_path)
  gpx_data = []
  gpx_doc = Nokogiri::XML(File.open(gpx_path))

  gpx_doc.xpath('//xmlns:trkpt').each do |trkpt|
    lat = trkpt['lat'].to_f
    lon = trkpt['lon'].to_f
    ele = trkpt.xpath('xmlns:ele').text.to_f
    time = Time.parse(trkpt.xpath('xmlns:time').text)
    gpx_data << { lat: lat, lon: lon, ele: ele, time: time }
  end

  gpx_data
end

def repair_fit_file(input_path, output_path, gpx_data)
  begin
    fitfile = RubyFit::File.new(input_path)
    repaired_records = []

    fitfile.records.each do |record|
      repaired_records << record
    end

    # Integrate GPX data if needed
    gpx_data.each do |gpx_record|
      # Create a new record using GPX data if necessary
      # This is a simplified example; actual integration would depend on the data format
      new_record = RubyFit::Record.new
      new_record.latitude = gpx_record[:lat]
      new_record.longitude = gpx_record[:lon]
      new_record.altitude = gpx_record[:ele]
      new_record.timestamp = gpx_record[:time]
      repaired_records << new_record
    end

    # Write the repaired records to a new FIT file
    repaired_fitfile = RubyFit::File.new
    repaired_records.each do |record|
      repaired_fitfile << record
    end

    File.open(output_path, 'wb') do |f|
      f.write(repaired_fitfile.to_bin)
    end

    puts "Repaired file saved to #{output_path}"
  rescue StandardError => e
    puts "Error processing FIT file: #{e.message}"
  end
end

input_path = './put_uncompleted_fit_here/activity_uncompleted.fit'
output_path = './restored_fit_files/activity_restored.fit'
gpx_path = './original_route/101.gpx'

gpx_data = read_gpx_file(gpx_path)
repair_fit_file(input_path, output_path, gpx_data)
