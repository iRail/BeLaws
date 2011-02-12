package be.iRail.BeLaws;

import be.iRail.BeLaws.page.Builder;
import be.iRail.BeLaws.page.IndexedBuilder;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.demo.FileDocument;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

/**
 *
 * @author pieterc
 */
public class Indexer extends HttpServlet {

    private String indexpath, lawspath;
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        indexpath = getServletContext().getInitParameter("indexdirectory");
        lawspath = getServletContext().getInitParameter("lawsdirectory");


        try {
            //Maybe first check a password?
            //...

            //Index the laws and save it to a file
            index();
            //Show some output to tell the world we're Indexed
            Builder b = new IndexedBuilder();
            b.setTitle("Indexed");
            b.setBodyObject("...");
            out.println(b.build());

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    /** Code snippet taken from the Lucene DEMO
     *
     *
     * Licensed to the Apache Software Foundation (ASF) under one or more
     * contributor license agreements.  See the NOTICE file distributed with
     * this work for additional information regarding copyright ownership.
     * The ASF licenses this file to You under the Apache License, Version 2.0
     * (the "License"); you may not use this file except in compliance with
     * the License.  You may obtain a copy of the License at
     *
     *     http://www.apache.org/licenses/LICENSE-2.0
     *
     * Unless required by applicable law or agreed to in writing, software
     * distributed under the License is distributed on an "AS IS" BASIS,
     * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
     * See the License for the specific language governing permissions and
     * limitations under the License.
     */
     private File INDEX_DIR;
    /** Index all text files under a directory. */
    private void index() {
        INDEX_DIR = new File(indexpath);
        final File docDir = new File(lawspath);
        if (!docDir.exists() || !docDir.canRead()) {
            System.out.println("Document directory '" + docDir.getAbsolutePath() + "' does not exist or is not readable, please check the path");

        } else {

            Date start = new Date();
            try {
                IndexWriter writer = new IndexWriter(FSDirectory.open(INDEX_DIR), new StandardAnalyzer(Version.LUCENE_CURRENT), true, IndexWriter.MaxFieldLength.LIMITED);
                System.out.println("Indexing to directory '" + INDEX_DIR + "'...");
                indexDocs(writer, docDir);
                System.out.println("Optimizing...");
                writer.optimize();
                writer.close();

                Date end = new Date();
                System.out.println(end.getTime() - start.getTime() + " total milliseconds");

            } catch (IOException e) {
                System.out.println(" caught a " + e.getClass()
                        + "\n with message: " + e.getMessage());
            }
        }
    }

    private void indexDocs(IndexWriter writer, File file)
            throws IOException {
        // do not try to index files that cannot be read
        if (file.canRead()) {
            if (file.isDirectory()) {
                String[] files = file.list();
                // an IO error could occur
                if (files != null) {
                    for (int i = 0; i < files.length; i++) {
                        indexDocs(writer, new File(file, files[i]));
                    }
                }
            } else {
                System.out.println("adding " + file);
                try {
                    writer.addDocument(FileDocument.Document(file));
                } // at least on windows, some temporary files raise this exception with an "access denied" message
                // checking if the file can be read doesn't help
                catch (FileNotFoundException fnfe) {
                }
            }
        }
    }
}
