{include file='user/main.tpl'}
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/editor.md@1.5.0/css/editormd.min.css" />

<main class="content">
    <div class="content-header ui-content-header">
        <div class="container">
            <h1 class="content-heading">创建工单</h1>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12 col-sm-12">
            <section class="content-inner margin-top-no">

                <div class="card">
                    <div class="card-main">
                        <div class="card-inner">
                            <div class="form-group form-group-label">
                                <label class="floating-label" for="title">标题</label>
                                <input class="form-control maxwidth-edit" id="title" type="text">
                            </div>


                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-main">
                        <div class="card-inner">
                            <div class="form-group form-group-label">
                                <label class="floating-label" for="content">内容</label>
                                <div id="editormd">
                                    <textarea style="display:none;" id="content"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="card">
                    <div class="card-main">
                        <div class="card-inner">

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-10 col-md-push-1">
                                        <button id="submit" type="submit" class="btn btn-block btn-brand">添加</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                {include file='dialog.tpl'}
            </section>

        </div>


    </div>
</main>


{include file='user/footer.tpl'}


<script src="https://cdn.jsdelivr.net/npm/editor.md@1.5.0/editormd.min.js"></script>
<script>
    $(document).ready(function() {
        function submit() {
            $("#result").modal();
            $$.getElementById('msg').innerHTML = '正在提交付...'
            $.ajax({
                type: "POST",
                url: "/user/ticket",
                dataType: "json",
                data: {
                    content: editor.getHTML(),
                    markdown: $('.editormd-markdown-textarea').val(),
                    title: $$getValue('title')
                },
                success: (data) => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                                               window.setTimeout("location.href='/user/ticket'", {$config['jump_delay']});
                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                    }
                },
                error: (jqXHR) => {
                    $("#msg-error").hide(10);
                    $("#msg-error").show(100);
                    $$.getElementById('msg-error-p').innerHTML = `发生错误：${
                            jqXHR.status
                            }`;
                }
            });
        }

        $("#submit").click(function() {
            submit();
        });
    });

    var uiChange;
    var x = window.matchMedia('(prefers-color-scheme: dark)');
    myFunction(x); // 执行时调用的监听函数
    x.addListener(myFunction); // 状态改变时添加监听器
    function myFunction(x) {
    if (x.matches) { // 媒体查询
    uiChange = "dark";
    editorUI = "pastel-on-dark";
    } else {
    uiChange = "default";
    editorUI = "default";
    }
    }

    $(function() {
        editor = editormd("editormd", {
            path: "https://cdn.jsdelivr.net/npm/editor.md@1.5.0/lib/", // Autoload modules mode, codemirror, marked... dependents libs path
            height: 720,
            saveHTMLToTextarea: true,
            theme: uiChange,
            previewTheme: uiChange,
            editorTheme: editorUI,
            placeholder: "请输入你想问的问题",
            lineNumbers: false,
            watch: false,
            toolbarIcons: function() {
            // Or return editormd.toolbarModes[name]; // full, simple, mini
            // Using "||" set icons align right.
            return ["undo", "redo", "|", "hr", "|", "watch", "|", "image", "|", "info", "||", "preview"]
            },
            height: 720
        });

        /*
        // or
        var editor = editormd({
            id   : "editormd",
            path : "../lib/"
        });
        */
    });
</script>
