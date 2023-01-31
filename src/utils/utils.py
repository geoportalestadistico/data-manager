def ellipsis(text, max_len=50):
    if len(text) <= max_len:
        return text
    else:
        return "{}…".format(text[:max_len])
