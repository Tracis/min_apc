json.extract! project, :id, :abbr_name, :name, :proj_types, :proj_start_time, :proj_end_time, :deleted_at, :created_at, :updated_at
json.url project_url(project, format: :json)
