return {
    python = {
        analysis = {
            typeCheckingMode = "strict",  -- basic, strict
            autoImportCompletions = true,
            diagnosticSeverityOverrides = {
                reportUnknownVariableType = "warning",
                reportUnusedImport = "information",
                reportUnusedVariable = "none",  -- it's already have hint
            }
        }
    }
}
