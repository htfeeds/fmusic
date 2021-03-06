package com.htf.fmusic.admin_controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.htf.fmusic.models.User;
import com.htf.fmusic.services.UserService;

/**
 * @author HTFeeds
 */
@ControllerAdvice
public class GlobalControllerAdvice {

    private static final Logger LOGGER = LoggerFactory.getLogger(GlobalControllerAdvice.class);

    private final UserService userService;

    @Autowired
    GlobalControllerAdvice(UserService userService) {
        LOGGER.debug("Inside GlobalControllerAdvice constructor.");
        this.userService = userService;
    }

    @ModelAttribute("loginModel")
    public User loginModel() {
        return getPrincipal();
    }

    public User getPrincipal() {
        LOGGER.debug("Getting the user of authenticated user.");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            LOGGER.debug("Current user is anonymous. Returning null.");
            return null;
        }

        Object principal = authentication.getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            User user = userService.findByUsername(username);
            LOGGER.debug("Returning user: {}", user);
            return user;
        } else {
            return null;
        }
    }
}
