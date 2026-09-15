-- Utility functions for mapping or settings

-- true when the editor is wider than it is tall.
-- Cells are roughly twice as tall as they are wide, so a visually square
-- editor reports columns ~= lines * 2 -- that ratio is the threshold.
function IS_WIN_LANDSCAPE()
	return vim.o.columns >= vim.o.lines * 2
end
