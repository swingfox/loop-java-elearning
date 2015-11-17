/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.LOIDE;


import java.io.File;
import java.util.List;

/**
 *
 * @author siegfred
 */
public interface LOIDEHandler {
    public LearningElementMeta getLearningElementMeta(String id);
    public File getLearningElement(String id);
    public List<LearningElementMeta> findLearningElementMeta(String title);
    public AuthorMeta getAuthorMeta(String id);
    public boolean submitLearningElement(LearningElementMeta meta, File file);
    public boolean submitLearningObject(LearningObjectMeta meta);
}
