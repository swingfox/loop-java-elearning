/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.LOIDE;


import java.io.File;
import java.util.List;

/**
 * @author siegfred
 */
public interface LOIDEHandler {
    LearningElementMeta getLearningElementMeta(String id);

    File getLearningElement(String id);

    List<LearningElementMeta> findLearningElementMeta(String title);

    AuthorMeta getAuthorMeta(String id);

    boolean submitLearningElement(LearningElementMeta meta, File file);

    boolean submitLearningObject(LearningObjectMeta meta);
}
