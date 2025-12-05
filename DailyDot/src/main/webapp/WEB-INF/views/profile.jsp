<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .profile-panel {
        padding: 15px 0px 15px 0px;
        font-family: 'Galmuri11', sans-serif;
    }

    .profileImage {
        text-align: left;
    }

    .UserInfo {
        text-align: left;
        margin-top: 7px;
    }
    
    .info {
    		margin-bottom: 2px;
    }
    
    .info .infoLabel {
    		font-weight: bold;
    		font-size: 14px;
    		margin-right: 4px;
    }
    
    .info .infoValue {
    		font-size: 12px;
    }
</style>

<div class="profile-panel" style="padding: 15px;">

    <div class="profileImage" style="text-align: left;">
        <img
            alt="profile"
            src="/image/profile.png"
            style="width: 140px; height: auto; padding-bottom: 8px;"
       	>

       	<div class="UserInfo" style="text-align: left; margin-top: 8px; font-size: 14px;">
        		<div class="info">
            		<span class="infoLabel">NICKNAME</span>
            		<span class="infoValue">${sessionScope.user.nickname }</span>
        		</div>
        		<div class="info">
            		<span class="infoLabel">MAJOR</span>
            		<span class="infoValue">${sessionScope.user.major }</span>
        		</div>
       	</div>

        <a href="/user/profileEdit" class="btn btn-sm text-secondary border-0 bg-transparent p-0" style="text-align: left; font-size: 12px">
            ⚙️ Edit Profile
        </a>
    </div>

</div>
