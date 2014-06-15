class ArchivesSpaceService < Sinatra::Base

  include ReportHelper::ResponseHelpers

  Endpoint.get("/repositories/:repo_id/reports/fiscal_accession")
    .description(ExtentAccessioned.report_opts[:description])
    .params(*(ExtentAccessioned.report_opts[:params] << ReportHelper.report_formats << ["repo_id", :repo_id]))
    .permissions([])
    .returns([200, "report"]) \
  do
    report_response(ExtentAccessioned.new(params), params[:format])
  end

end
