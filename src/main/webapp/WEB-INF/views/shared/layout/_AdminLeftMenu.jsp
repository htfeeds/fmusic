<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>
<%@ include file="../taglib.jsp"%>

<tilesx:useAttribute name="current" />

<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">

            <li class="nav-header">
                <div class="profile-element">
                    <span>
						<c:if test="${not empty loginModel.imageUrl}">
							<img alt="image" class="img-circle img-avatar-size" src="<c:url value="${loginModel.imageUrl}" />" />
						</c:if>
					</span>
                    <a href="#">
                        <span class="clear">
							<span class="block m-t-xs"><strong class="font-bold">${loginModel.fullname}</strong></span>
                        	<span class="text-muted text-xs block">
								<c:out value="${loginModel.email}" />
							</span>
                        </span>
                    </a>
                </div>
            </li>

            <li class="${current == 'index' ? 'active' : ''}">
                <a href='<spring:url value="/admin/" />'><i class="fa fa-th-large"></i><span class="nav-label">Dashboard</span></a>
            </li>

            <li class="${current == 'mail' ? 'active' : ''}">
                <a href='<spring:url value="/admin/mail/" />'>
                    <i class="fa fa-envelope"></i> <span class="nav-label">Mailbox</span>
                    <span class="label label-warning pull-right">0/0</span>
                </a>
            </li>

            <li class="${current == 'user' ? 'active' : ''}">
                <a href='<spring:url value="/admin/user/" />'><i class="fa fa-user"></i><span class="nav-label">Users</span></a>
            </li>

            <li class="${current == 'role' ? 'active' : ''}">
                <a href='<spring:url value="/admin/role/" />'><i class="fa fa-question"></i><span class="nav-label">Roles</span></a>
            </li>

            <li class="${current == 'song' ? 'active' : ''}">
                <a href='<spring:url value="/admin/song/" />'><i class="fa fa-music"></i><span class="nav-label">Songs</span></a>
            </li>

            <li class="${current == 'artist' ? 'active' : ''}">
                <a href='<spring:url value="/admin/artist/" />'><i class="fa fa-star"></i><span class="nav-label">Artists</span></a>
            </li>

            <li class="${current == 'playlist' ? 'active' : ''}">
                <a href='<spring:url value="/admin/playlist/" />'><i class="fa fa-youtube-play"></i><span class="nav-label">Playlists</span></a>
            </li>

            <li class="${current == 'pltype' ? 'active' : ''}">
                <a href='<spring:url value="/admin/pltype/" />'><i class="fa fa-question"></i><span class="nav-label">Playlist Type</span></a>
            </li>

            <li class="${current == 'lyric' ? 'active' : ''}">
                <a href='<spring:url value="/admin/lyric/" />'><i class="fa fa-question"></i><span class="nav-label">Lyrics</span></a>
            </li>

            <li class="${current == 'genre' ? 'active' : ''}">
                <a href='<spring:url value="/admin/genre/" />'><i class="fa fa-question"></i><span class="nav-label">Genres</span></a>
            </li>

            <li class="landing_link">
                <a target="_blank" href='<spring:url value="/" />'><i class="fa fa-play"></i><span class="nav-label">Landing FMusic</span></a>
            </li>

        </ul>

    </div>
</nav>