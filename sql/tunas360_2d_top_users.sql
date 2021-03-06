DEF section_id = '2d';
DEF section_name = 'Top Users';
EXEC DBMS_APPLICATION_INFO.SET_MODULE('&&tunas360_prefix.','&&section_id.');
SPO &&tunas360_main_report..html APP;
PRO <h2>&&section_id.. &&section_name.</h2>
PRO <ol start="&&report_sequence.">
SPO OFF;

DEF main_table = 'GV$SESSION';
BEGIN
  :sql_text_backup := '
SELECT username,
       samples,
       TRUNC(100*RATIO_TO_REPORT(samples) OVER (),2) percent,
       NULL dummy_01
  FROM (SELECT username,
               COUNT(*) samples
         FROM (SELECT position inst_id, object_type username 
                 FROM plan_table
                WHERE statement_id = ''TUNAS360_DATA'')
        WHERE @filter_predicate@
        GROUP BY username)
 ORDER BY 2 DESC NULLS LAST
';
END;
/

DEF skip_pch = '';
DEF skip_all = '&&is_single_instance.';
DEF title = 'Top Users for Cluster';
EXEC :sql_text := REPLACE(:sql_text_backup, '@filter_predicate@', '1 = 1 /* all instances */');
@@&&skip_all.tunas360_9a_pre_one.sql

DEF skip_pch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM gv$instance WHERE inst_id = 1;
DEF title = 'Top Users for Instance 1';
EXEC :sql_text := REPLACE(:sql_text_backup, '@filter_predicate@', 'inst_id = 1');
@@&&skip_all.tunas360_9a_pre_one.sql

DEF skip_pch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM gv$instance WHERE inst_id = 2;
DEF title = 'Top Users for Instance 2';
EXEC :sql_text := REPLACE(:sql_text_backup, '@filter_predicate@', 'inst_id = 2');
@@&&skip_all.tunas360_9a_pre_one.sql

DEF skip_pch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM gv$instance WHERE inst_id = 3;
DEF title = 'Top Users for Instance 3';
EXEC :sql_text := REPLACE(:sql_text_backup, '@filter_predicate@', 'inst_id = 3');
@@&&skip_all.tunas360_9a_pre_one.sql

DEF skip_pch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM gv$instance WHERE inst_id = 4;
DEF title = 'Top Users for Instance 4';
EXEC :sql_text := REPLACE(:sql_text_backup, '@filter_predicate@', 'inst_id = 4');
@@&&skip_all.tunas360_9a_pre_one.sql

DEF skip_pch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM gv$instance WHERE inst_id = 5;
DEF title = 'Top Users for Instance 5';
EXEC :sql_text := REPLACE(:sql_text_backup, '@filter_predicate@', 'inst_id = 5');
@@&&skip_all.tunas360_9a_pre_one.sql

DEF skip_pch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM gv$instance WHERE inst_id = 6;
DEF title = 'Top Users for Instance 6';
EXEC :sql_text := REPLACE(:sql_text_backup, '@filter_predicate@', 'inst_id = 6');
@@&&skip_all.tunas360_9a_pre_one.sql

DEF skip_pch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM gv$instance WHERE inst_id = 7;
DEF title = 'Top Users for Instance 7';
EXEC :sql_text := REPLACE(:sql_text_backup, '@filter_predicate@', 'inst_id = 7');
@@&&skip_all.tunas360_9a_pre_one.sql

DEF skip_pch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM gv$instance WHERE inst_id = 8;
DEF title = 'Top Users for Instance 8';
EXEC :sql_text := REPLACE(:sql_text_backup, '@filter_predicate@', 'inst_id = 8');
@@&&skip_all.tunas360_9a_pre_one.sql

SPO &&tunas360_main_report..html APP;
PRO </ol>
SPO OFF;