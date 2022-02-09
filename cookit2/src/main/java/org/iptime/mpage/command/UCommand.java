package org.iptime.mpage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UCommand {
    void execute(HttpServletRequest request, HttpServletResponse response);
}
