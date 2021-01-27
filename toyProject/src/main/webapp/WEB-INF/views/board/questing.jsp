<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jquery.easing.1.3.js"></script>
    <script src="../js/jquery.mousewheel.min.js"></script>
    <link rel="stylesheet"  type="text/css" href="../css/common.css"> 
    <link rel="stylesheet"  type="text/css" href="../css/questing.css"> 

    <title>ìì£¼íë ì§ë¬¸</title>
<script>
    $(function(){


        $(".menu").each(function(i){

            $($(".menu :odd").eq(i)).hover(function(){

                $($(".even-box").eq(i)).toggle();


            })

        })


    });


</script>   

</head>

<body>
<div id="all-wrap">
    <!--ì½íì¸  -->
    <div id="content-wrap">
        <nav>
            <h1>ì»¤ë®¤ëí°</h1>
            <ul id="member-tab">
                <li><a>ê³µì§ì¬í­</a></li>
                <li id="click-menu"><a>ìì£¼íë ì§ë¬¸</a></li>
                <li><a>ìì ê²ìí</a></li>
            </ul>
        </nav>

      <div id="community-wrap">
    
                <h2>ìì£¼íë ì§ë¬¸</h2>
            
            <ul id="btn-list">
                <li>

                    <input type="button" name="all" value="ì ì²´" />

                </li>

                <li>

                    <input type="button" value="ê³µì°ìë´ ë° ìë§¤" />

                </li>

                <li>

                    <input type="button" value="ëê´" />

                </li>

                <li>

                    <input type="button" value="ê¸°í" />

                </li>

            </ul>
       
           
            <ul id="qn-list">
                    <li class="questing-odd qli">
                        <div class="odd-box">
                            <ul class="box-list">
                                <li class="menu">
                                   <a > ê³µì°ìë´.</a>
                                </li>
                                <li class="menu">
                                  <a> ê³µì°ì ë³´ë¥¼ ìê³  ì¶ìµëë¤. </a>

                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="questing-even qli">
                        <div class="even-box">
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </div>
                    </li>


                    <li class="questing-odd qli">
                        <div class="odd-box">
                            <ul class="box-list">
                                <li class="menu">
                                   <a > ê³µì°ìë´.</a>
                                </li>
                                <li class="menu">
                                  <a> ê³µì°ì ë³´ë¥¼ ìê³  ì¶ìµëë¤. </a>

                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="questing-even qli">
                        <div class="even-box">
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </div>
                    </li>


                    <li class="questing-odd qli">
                        <div class="odd-box">
                            <ul class="box-list">
                                <li class="menu">
                                   <a > ê³µì°ìë´.</a>
                                </li>
                                <li class="menu">
                                  <a> ê³µì°ì ë³´ë¥¼ ìê³  ì¶ìµëë¤. </a>

                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="questing-even qli">
                        <div class="even-box">
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </div>
                    </li>

            
            </ul>
    
        </div>
    </div>
</div>

</body>

</html>