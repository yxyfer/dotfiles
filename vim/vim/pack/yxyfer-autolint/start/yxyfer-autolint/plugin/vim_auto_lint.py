from vim import *

def linter():

    cw = vim.current.window
    # Getting cursor pos before refresh
    cur_pos = cw.cursor
    cw.redraw
    cw.cursor = (cur_pos[0], cur_pos[1])
