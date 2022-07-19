<%from clld_markdown_plugin import markdown%>
<%import re%>
<link rel="stylesheet" href="${req.static_url('clld_document_plugin:static/clld-slides.css')}"/>

<style>
#top {
    position: fixed;
    width: 100%;
}
#buffer {
    min-height: 40px
}
</style>


<div class="slides-wrapper">

<div class="slides-nav">
<button class="btn btn-light previous">←</button>
<button class="btn btn-light next">→</button>
</div>

<% tent = "\n" + ctx.description %>
<% delim = "\n## " %>
<% parts = tent.split(delim)[1::] %>

% for (i, part) in enumerate(parts):
    <% title, content = part.split("\n", 1) %>
    <% tag = re.findall("{#(.*?)}", title) %>
    <% title = title.split("{#")[0].strip() %>
    % if len(tag) == 0:
        <% tag = f"slide-{i}" %>
    % else:
        <% tag = tag[0] %>
    % endif
    % if i == 0:
        <% cl = "slide active" %>
    % else:
        <% cl = "slide" %>
    % endif
    <div id="${tag}" class="${cl}"><h2>${title}</h2>${markdown(request, content, permalink=False)|n}</div>


% endfor

</div>

<script src="${req.static_url('clld_document_plugin:static/clld-slides.js')}"></script>
