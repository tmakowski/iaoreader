# Main panel UI ----------------------------------------------------------------
main_panel_ui <- function() {
    mainPanel(
        tags$div(
            id = "main_panel",
            tabsetPanel(
                peptide_coverage_ui(),
                data_preview_ui()
            )
        )
    )
}


# Peptide Coverage tab UI ------------------------------------------------------
peptide_coverage_ui <- function() {
    tabPanel(
        "Peptide Coverage",
        no_file_uploaded_wrapper(
            no_file_good_wrapper(

                h3(
                    id = "plot_coverage_header", "Coverage Plot",
                    actionButton(
                        "plot_info",
                        icon("info-circle"),
                        class = "label_icon"
                    )
                ),
                div(id = "plot"),
                div(
                    align = "right",
                    actionButton(
                        "download_svg",
                        HTML(paste(icon("download"), "Save plot (.svg)"))
                    )
                ),

                h3(id = "summary_table_header", "Summary Table"),
                p(
                    id = "summary_table_description",
                    "Table rows represent uploaded files with data in current",
                    "plot boundaries. Table columns contain",
                    modal_link("measure_info", "measure"),
                    "values for every element of the sequence."
                ),
                div(
                    align = "center",
                    tableOutput("summary_table")
                )
            )
        )
    )
}


# Data Preview tab UI ---------------------------------------------------------
data_preview_ui <- function() {
    tabPanel(
        "Data Preview",
        no_file_uploaded_wrapper(
            no_file_good_wrapper(
                div(
                    id = "previewed_file_div",
                    selectInput("previewed_file", "Select File to Preview", NULL)
                ),
                DT::dataTableOutput("data_preview")
            )
        )
    )
}
